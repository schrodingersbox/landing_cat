module LandingCat
  class Page < ActiveRecord::Base
    has_many :leads

    validates_presence_of :experiment_id, :experiment_type
    validates_uniqueness_of :experiment_type, :scope => :experiment_id

    belongs_to :experiment, :class_name => 'SplitCat::Experiment'

    after_save :update_experiment

    def update_experiment
      return unless experiment

      hypothesis = experiment.hypotheses.where( :name => experiment_type ).first
      hypothesis = experiment.hypotheses.create( :name => experiment_type ) unless hypothesis
      hypothesis.update_attribute( :weight, weight )

      if experiment.goals.empty?
        experiment.goals.create( :name => :clicked )
      end
    end

  end
end