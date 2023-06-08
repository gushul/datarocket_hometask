require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) { attributes_for(:post) }

  let(:valid_session) { {} }

  describe "POST #create" do
    # TODO add test for invalid params
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: valid_attributes }, session: valid_session
        }.to change(Post, :count).by(1)
      end


      context "when ActiveJob is set to :test" do
        before do
          ActiveJob::Base.queue_adapter = :test
        end

        it "enqueues PostCreationMailer and HistoryCreatorJob" do

          expect {
            post :create, params: { post: valid_attributes }, session: valid_session
          }.to have_enqueued_job(Histories::CreatePostJob)
            .and have_enqueued_job(ActionMailer::MailDeliveryJob)
        end
      end

      context "when ActiveJob is set to :inline" do
        before do
          ActiveJob::Base.queue_adapter = :inline
        end

        it "create history record" do
          expect {
            post :create, params: { post: valid_attributes }, session: valid_session
          }.to change(History, :count).by(1)
        end
      end
    end
  end
end

