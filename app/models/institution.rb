class Institution < ActiveRecord::Base
  has_many :trainings, dependent: :destroy
  has_many :instructors, dependent: :destroy
  validates_presence_of :name


  def DeleteReferences

    @trainings = self.trainings.all

    @trainings.each do |t|
      t.institution_id = nil
      if t.save
        puts 'salvado'
      else
        puts 'no salvado'
      end

    end


  end


end
