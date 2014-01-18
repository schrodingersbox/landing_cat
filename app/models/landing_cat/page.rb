module LandingCat
  class Page < ActiveRecord::Base
    has_many :leads

    validates_uniqueness_of :experiment_type, :scopre => :experiment_id

    belongs_to :experiment, :class_name => 'SplitCat::Experiment'

    after_save :update_hypothesis

    def update_hypothesis
      return unless experiment

      hypothesis = experiment.hypotheses.where( :name => name ).first
      hypothesis = experiment.hypotheses.create( :name => name ) unless hypothesis
      hypothesis.update_attribute( :weight, weight )
    end

  end
end