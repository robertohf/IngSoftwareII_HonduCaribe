class Employee < ActiveRecord::Base
  validates_uniqueness_of :work_id, :name
  validates_numericality_of :work_id, greater_than: 0
  validates_numericality_of :emergency_contact_number, greater_than: 0
  has_attached_file :image,
                    storage: :s3,
                    s3_permissions: 'public-read-write',
                    url: 's3-us-west-2.amazonaws.com/honducariberrhh',
                    path: '/assets/photos/:id/:style/:basename.:extension',
                    s3_host_name: 's3-us-west-2.amazonaws.com'
                    
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_many :educations
  has_many :work_exps
  has_many :dependants
  has_many :employee_abilities
  has_many :abilities, through: :employee_abilities
  belongs_to :work_structure
  has_many :training_employees
  has_many :trainings, through: :training_employees
  has_many :hours
  has_many :permissions

  def self.civil_statuses
    ['Soltero', 'Casado', 'Viudo', 'Divorciado', 'Union Libre']
  end

  def self.bloods
    ['O-', 'O', 'A-', ' A+', 'B-', ' B+', 'AB-', ' AB+']
  end

  def self.contracts
    %w[Permanente Temporal Practicante]
  end

  def self.parentesco
    %w[Hijo Conyuge Hermano]
  end

  def self.habilidades
    %w[Ejemplo1 Ejemplo2 Ejemplo3]
  end

  def self.tiposhorarios
    %w[Diurno Mixto Nocturno]
  end

  def self.age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end

  def self.TieneHijosMenores
    employees = Employee.all
    employees.each do |e|
      if e.dependants.any?
        e.dependants.each do |d|
          if !d.birth_at.nil?
            e.hasChildren = true if age(d.birth_at) < 18
          else
            e.hasChildren = false
          end
        end
      end
      e.save!
    end
  end

  def get_hours(time_in, time_out)
    hours = {}
    hours['normal'] = 0
    hours['25'] = 0
    hours['50'] = 0
    hours['75'] = 0
    hours['100'] = 0
    self.hours.where(time_in: time_in.in_time_zone('UTC').beginning_of_day..time_out.in_time_zone('UTC').end_of_day).each do |h|
      (h.time_in.to_i..h.time_out.to_i).step(1.hour) do |x|
        hours['normal'] += ((h.time_in.change(hour: 8)..h.time_out.change(hour: 17)).cover?(Time.at(x)) ? 1 : 0)
        hours['25'] += ((h.time_in.change(hour: 17)..h.time_out.change(hour: 21)).cover?(Time.at(x)) ? 1 : 0)
        hours['50'] += ((h.time_in.change(hour: 21)..h.time_out.change(hour: 0)).cover?(Time.at(x)) ? 1 : 0)
        hours['75'] += ((h.time_in.change(hour: 4)..h.time_out.change(hour: 8)).cover?(Time.at(x)) ? 1 : 0)
        hours['100'] += ((h.time_in.change(hour: 0)..h.time_out.change(hour: 4)).cover?(Time.at(x)) ? 1 : 0)
      end
    end
    hours
  end
end
