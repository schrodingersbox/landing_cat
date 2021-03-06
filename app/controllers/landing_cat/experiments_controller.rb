module LandingCat
  class ExperimentsController < PublicController

    before_action :set_experiment, :only => :show
    before_filter :set_split_cat_cookie, :only => :show

    def show
      @hypothesis = split_cat_hypothesis( @experiment.name, @split_cat_token )
      @page = Page.where( :experiment_id => @experiment.id, :experiment_type => @hypothesis ).first
      render 'landing_cat/pages/show'
    end

    private
      def set_experiment
        @experiment = SplitCat::Experiment.where( :name => params[ :name ] ).first if params[ :name ]
        @experiment ||= SplitCat::Experiment.find( params[ :id ] )
      end

  end
end
