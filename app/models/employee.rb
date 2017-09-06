class Employee < ActiveRecord::Base
  validates_uniqueness_of :work_id, :name
  validates_numericality_of :work_id, greater_than: 0
  validates_numericality_of :emergency_contact_number, greater_than: 0
  mount_uploader :avatar, AvatarUploader
  
  has_many :educations, dependent: :destroy
  has_many :work_exps, dependent: :destroy
  has_many :dependants, dependent: :destroy
  has_many :employee_abilities, dependent: :destroy
  has_many :abilities, through: :employee_abilities
  belongs_to :work_structure
  has_many :training_employees, dependent: :destroy
  has_many :trainings, through: :training_employees
  has_many :hours, dependent: :destroy
  has_many :permissions, dependent: :destroy
  has_many :incapacities, dependent: :destroy

  validates_presence_of :name

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
    %w[Hijo Conyuge Hermano Padre Madre]
  end

  def self.habilidades
    %w[Ejemplo1 Ejemplo2 Ejemplo3]
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
    hours['Extra'] = 0
    hours['VAC'] = 0
    hours['ASP'] = 0
    hours['ACP'] = 0
    puts time_in..time_out
    self.hours.each do |h|
      puts h.time_in..h.time_out
      (h.time_in.to_i..h.time_out.to_i).step(1.minute) do |y|
        x = Time.at(y)+6.hours
        if(x >= time_in && x <= time_out)
          my_time_in = h.time_in
          my_time_out = h.time_out
          if(ApplicationController.helpers.is_holiday(x)) #Add holidays
            hours['100'] += 1;
          else
            if(h.scheduletype == "Diurno")
              if ((my_time_in.change(hour: 5, minute: 0)+6.hours .. my_time_out.change(hour: 19)+6.hours).cover?(x))
                if(hours['normal'] < 480)
                  hours['normal'] += 1
                else
                  hours['25'] += 1
                end
              elsif (my_time_in.change(hour: 19, minute: 0)+6.hours .. my_time_out.change(hour: 22)+6.hours).cover?(x)
                hours['50'] += 1
              else
                hours['75'] += 1
              end
            elsif(h.scheduletype == "Mixto")
              if ((my_time_in.change(hour: 14, minute: 0)+6.hours .. my_time_out.change(hour: 21)+6.hours).cover?(x))
                if(hours['normal'] < 420)
                  hours['normal'] += 1
                elsif ((my_time_in.change(hour: 14, minute: 0)+6.hours .. my_time_out.change(hour: 19)+6.hours).cover?(x))
                  hours['25'] += 1
                else
                  hours['50'] += 1
                end
              elsif (my_time_in.change(hour: 5, minute: 0)+6.hours .. my_time_out.change(hour: 14)+6.hours).cover?(x)
                hours['25'] += 1
              elsif (my_time_in.change(hour: 21, minute: 0)+6.hours .. my_time_out.change(hour: 22)+6.hours).cover?(x)
                hours['50'] += 1
              else
                hours['75'] += 1
              end
            else
              if ((my_time_in.change(hour: 5, minute: 0)+6.hours .. my_time_out.change(hour: 19)+6.hours).cover?(x))
                hours['25'] += 1
              elsif ((my_time_in.change(hour: 19, minute: 0)+6.hours .. my_time_out.change(hour: 22)+6.hours).cover?(x))
                hours['50'] += 1
              else
                if(hours['normal'] < 360)
                  hours['normal'] += 1
                else
                  hours['75%'] += 1
                end
              end
            end
          end
        end
      end
    end

    #Lazy way to remove trailing 1
    if(hours['normal'] % 10 == 1)
      hours['normal']-=1
    end
    if(hours['25'] % 10 == 1)
      hours['25']-=1
    end
    if(hours['50'] % 10 == 1)
      hours['50']-=1
    end
    if(hours['75'] % 10 == 1)
      hours['75']-=1
    end
    if(hours['100'] % 10 == 1)
      hours['100']-=1
    end
    hours['Extra'] = hours['25'] + hours['50'] + hours['75'] + hours['100']

    self.permissions.where(time_in: time_in.in_time_zone('UTC').beginning_of_day..time_out.in_time_zone('UTC').end_of_day).each do |x|
      if x.time_out.present? and x.time_in.present?
        if x.time_out.hour - x.time_in.hour > 8
          if x.permission_type == "Vacaciones"
            hours['VAC'] += 8
          elsif x.permission_type == "Sin Permiso"
            hours['ASP'] += 8
          else
            hours['ACP'] +=8
          end
        else
          if x.permission_type == "Vacaciones"
            hours['VAC'] += x.time_out.hour - x.time_in.hour
          elsif x.permission_type == "Sin Permiso"
            hours['ASP'] += x.time_out.hour - x.time_in.hour
          else
            hours['ACP'] +=x.time_out.hour - x.time_in.hour
          end
        end
      end
    end
    puts hours['normal']
    puts hours['25']
    puts hours['50']
    puts hours['75']
    puts hours['100']
    hours
  end

  def self.AddAbility(employeeId, abilityId, training_id)

    @employee = Employee.find(employeeId)
    @employee_ability = @employee.employee_abilities.build

    @employee_ability.employee_id = employeeId
    @employee_ability.ability_id = abilityId
    @employee_ability.training_id = training_id

    @employee_ability.save

  end

  def self.RemoveTrainingAbilities(trainingId, employeeId)
    @employee = Employee.find(employeeId)
    @employee_abilities = @employee.employee_abilities.all

    @employee_abilities.each do |a|
      if a.training_id == trainingId
        a.destroy
      end
    end
  end


    def self.RemoveTrainingReferences(trainingId, employeeId)
      @employee = Employee.find(employeeId)
      @employee_abilities = @employee.employee_abilities.all

      @employee_abilities.each do |a|
        if a.training_id == trainingId
          a.training_id = nil
          a.save
        end
      end
    end

    def self.RemoveWorkReferences(workId, employeeId)

      @employee = Employee.find(employeeId)
      if @employee.work_structure_id == workId
        @employee.work_structure_id = nil
        @employee.save
      end

    end

end
