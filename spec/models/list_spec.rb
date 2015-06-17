require 'rails_helper'

RSpec.describe List, type: :model do
  describe "associations" do
    context "#to_dos" do
      it "should destroy to dos if list is destroyed" do
        list = List.create(title: 'test')
        list.to_dos.create(title: 'to do test 1')
        list.to_dos.create(title: 'to do test 2')

        expect {
          list.destroy
        }.to change(ToDo, :count).by(-2)
      end
    end
  end
end
