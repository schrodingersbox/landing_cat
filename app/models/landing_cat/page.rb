module LandingCat
  class Page < ActiveRecord::Base

    EXPERIMENT_GOAL = :clicked

    BASE_ATTRIBUTES = [ :id, :experiment_id, :weight, :experiment_type ]

    has_many :leads

    validates_presence_of :experiment_id, :experiment_type
    validates_uniqueness_of :experiment_type, :scope => :experiment_id

    belongs_to :experiment, :class_name => 'SplitCat::Experiment'

    after_save :update_experiment

    def editable_attributes
      base_attributes = BASE_ATTRIBUTES.map { |a| a.to_s }
      return ( attributes.keys - base_attributes ).sort.map { |a| a.to_sym }
    end

    def hypothesis
      hypothesis = experiment.hypotheses.where( :name => experiment_type ).first
      hypothesis = experiment.hypotheses.create( :name => experiment_type ) unless hypothesis
      return hypothesis
    end

    def update_experiment
      return unless experiment

      hypothesis.update_attribute( :weight, weight )

      if experiment.goals.empty?
        experiment.goals.create( :name => EXPERIMENT_GOAL )
      end
    end

  end
end