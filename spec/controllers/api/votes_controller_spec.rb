RSpec.describe Api::VotesController do
  describe 'POST #create' do
    context 'successful' do
      it 'it should create a vote' do
        user = User.create(email: 'haha@yahoo.com', password: 'haha@yahoo.com')
        poll = double(id: 0)
        restaurant = double(id: 0)

        allow_any_instance_of(Votes::CreateService).to receive(:call)
        expect_any_instance_of(Votes::CreateService).to receive(:call)

        post :create, params: {
          user_id: user.id, poll_id: poll.id, restaurant_id: restaurant.id
        }
      end
    end
  end

  describe 'GET #index' do
    subject(:user) { User.create(email: 'haha@yahoo.com', password: 'haha@yahoo.com') }

    it "it should display all votes" do
      poll = Poll.create(user: user)
      restaurant = Restaurant.create(user: user, name: 'Jolibe')
      vote = Vote.create( user_id: user.id, poll_id: poll.id, restaurant_id: restaurant.id )

      restaurant2 = Restaurant.create(user: user, name: 'McDo')
      vote = Vote.create( user_id: user.id, poll_id: poll.id, restaurant_id: restaurant2.id )

      get :index, params: { user_id: user.id }
      expect(response.body.to_s).to eq(Vote.all.to_json)
    end
  end

  describe 'GET #show' do
    it "it should display specific vote" do
      user = User.create(email: 'haha@yahoo.com', password: 'haha@yahoo.com')
      poll = Poll.create(user: user)
      restaurant = Restaurant.create(user: user, name: 'Jolibe')
      vote = Vote.create( user_id: user.id, poll_id: poll.id, restaurant_id: restaurant.id )

      get :show, params: {
        user_id: user.id, id: vote.id
      }
      expect(response_json['id']).to eq vote.id
    end
  end



end
