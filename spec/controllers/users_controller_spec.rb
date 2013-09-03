require 'spec_helper'

describe UsersController do

  let(:user_params) { FactoryGirl.build(:user_params) }
  let(:invalid_user_params) { FactoryGirl.build(:invalid_user_params) }
  let(:user) { FactoryGirl.create(:user) }

  describe '#new' do

    it 'should assign @user' do
      get :new
      assigns(:user).class.should eq(User)
    end

  end

  describe '#create' do

    context 'with valid params' do
      it 'should create new user' do
        expect{
         post :create, user: user_params
        }.to change(User, :count).by(1)
      end
    end

      it 'should redirect to event index' do
        post :create, user: user_params
        expect(response).to redirect_to(root_path)
      end

      context 'with invalid params' do
        it 'should not create user' do
          expect{
           post :create, user: invalid_user_params
          }.to change(User, :count).by(0)
          flash[:error].should_not be_nil
        end

        it 'should render new' do
          post :create, user: invalid_user_params
          expect(response).to render_template(:new)
        end
      end
  end

  describe '#edit' do
    it 'should assign @user' do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it 'should render edit' do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end
  end


  describe '#update' do
    context 'with valid params' do
      it 'should update user object' do
        put :update, id: user.id, user: user_params
        user.reload
        user.username.should eq('Name')
        user.email.should eq('user@email.com')
      end

      it 'should redirect to events index' do
        put :update, id: user.id, user: user_params
        expect(response).to redirect_to root_path
      end
    end

  context 'with invalid params' do
      it 'should not save' do
        put :update, id: user.id, user: invalid_user_params
        user.reload
        user.username.should eq('exampleuser')
        user.email.should eq('example@email.com')
        flash[:error].should_not be_nil
      end

      it 'should render edit' do
        put :update, id: user.id, user: invalid_user_params
        expect(response).to render_template :edit
      end
    end
  end

  describe "destroy" do
    it "should delete user" do
      user
      expect{ delete :destroy, id: user.id }.to change(User, :count).by(-1)
    end

    it "should redirect to event index" do 
      delete :destroy, id: user.id
      expect(response).to redirect_to root_path
    end
  end
end
