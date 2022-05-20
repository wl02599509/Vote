class CandidatesController < ApplicationController

    before_action :find_candidate_id, only: [:show, :edit, :update, :destroy, :vote]

    def index
        @candidates = Candidate.all
    end

    def show
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            redirect_to '/candidates'
            flash[:notice]='Create Candidate successfully!'
        else
            render :new
        end      
    end

    def edit
    end

    def update
        if @candidate.update(candidate_params)
            flash[:notice]='Candidate updated successfully!'
            redirect_to '/candidates'
        else
            render :edit
        end
    end

    def destroy
        @candidate.destroy

        flash[:notice]='Candidate deleted and never got back....'
        redirect_to '/candidates'
    end

    def vote
        @candidate.vote_logs.create(ip_address: request.remote_ip)
        #send mails
        VoteMailer.vote_notify('wl02599509@gmail.com').deliver
        flash[:notice]='Voted!'
        redirect_to '/candidates'
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

    def find_candidate_id
        @candidate = Candidate.find_by(id: params[:id]) 
    end
end
