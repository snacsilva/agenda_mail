require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :controller do

    let(:user) { FactoryBot.create(:user)}
    let(:user1) { FactoryBot.create(:user)}
    let(:master) { FactoryBot.create(:user,:master)}
    let(:message) { FactoryBot.create(:message,to: user.id,from: user1.id)}
    let(:message1) { FactoryBot.create(:message,to: user1.id,from: user.id)}
    let(:read_message) { FactoryBot.create(:message,:read,to: user.id)}
    let(:archived_message) { FactoryBot.create(:message,:archived,to: user.id)}
    let(:archived_message1) { FactoryBot.create(:message,:archived,to: user1.id)}


    describe '#index' do
        context 'when is normal user' do
          before do
            sign_in user
          end

          it 'list all personal non archived messages' do
            message
            archived_message
            get :index
            expect(assigns(:messages)).to eq([message])
          end

          it 'can be reached' do
            get :index
            expect(response).to render_template :index
          end

        end

        context 'when is master' do
          before do
            sign_in master
          end

          it 'list all non archived messages' do
            message
            message1
            get :index
            expect(assigns(:messages).size).to eq(2)
          end
        end
    end
end
