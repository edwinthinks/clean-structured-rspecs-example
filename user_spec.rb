require './user'

describe User do

  describe '#jumps_high?' do
    subject { user.jumps_high? }
    let(:user) { User.new(is_frog: user_is_frog) }

    context "when the user is a frog" do
      let(:user_is_frog) { true }

      it 'should return true' do
        expect(subject).to be true
      end
    end

    context "when the user is not a frog" do
      let(:user_is_frog) { false }

      it 'should return false' do
        expect(subject).to be false
      end
    end
  end

  describe '#turn_to_frog' do
    subject { -> { user.turn_to_frog } }
    let(:user) { User.new(is_frog: user_is_frog) }

    context 'when the user is a frog' do
      let(:user_is_frog) { true }

      it 'should raise a error saying that the user is already a frog' do
        expect { subject.call }.to raise_error('user is already a frog')
      end
    end

    context 'when the user is not a frog' do
      let(:user_is_frog) { false }

      # Optionally you could use the before block to setup the situation
      # described by the context futher and/or make assertions about the
      # initial state
      before do
        expect(user.jumps_high?).to be false
        # Call the method to transform/mutate the state of the user
        subject.call
      end

      it 'should make the user to jump high' do
        expect(user.jumps_high?).to be true
      end
    end
  end
end
