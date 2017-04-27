RSpec.describe Api::VotesController do
  describe 'POST #create' do
    context 'successful' do
      it 'it should create a vote' do
        user = User.create(email: 'haha@yahoo.com', password: 'haha@yahoo.com')
        poll = Poll.create(user: user)
        restaurant = Restaurant.create(user: user, name: 'Jolibe')

        post :create, params: {
          user_id: user.id, poll_id: poll.id, restaurant_id: restaurant.id
        }

        expect(response.status).to eq 200
        expect(Vote.count).to eq 1

        vote = Vote.first

        expect(vote.user).to eq user
        expect(vote.poll).to eq poll
        expect(vote.restaurant).to eq restaurant

        expect { post :create, params: {
          user_id: user.id, poll_id: poll.id, restaurant_id: restaurant.id
        }}.to_not change { Vote.count }

#         expect(Vote.count).to eq 1
      end
    end
  end
end
