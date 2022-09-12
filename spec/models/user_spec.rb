require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "validation test" do
    it 'ensure email and password presence' do
      user = User.new(email:"Email@gmail.com", password:"Password")
      expect(user.save).to eq(true)
    end

    it 'should save successfully' do
      user = User.new().save
      expect(user).to eq(false)
    end
  end
  it("has many posts") do
    user = User.create(email:"Email@gmail.com", password:"Password")
    post1 = Post.create(title:"Title1",body:"Body1",user_id: user.id)
    post2 = Post.create(title:"Title2",body:"Body2",user_id: user.id)
    expect(user.posts()).to(eq([post1, post2]))
  end
  it("has many comments") do
    user = User.create(email:"Email@gmail.com", password:"Password")
    post = Post.create(title:"Title",body:"Body",user_id: user.id)
    comment1 = Comment.create(comment:"Comment1",post_id: post.id,user_id: user.id)
    comment2 = Comment.create(comment:"Comment2",post_id: post.id,user_id: user.id)
    expect(user.comments()).to(eq([comment1, comment2]))
  end
  it("has many likes") do
    user = User.create(email:"Email@gmail.com", password:"Password")
    post = Post.create(title:"Title",body:"Body",user_id: user.id)
    like1 = Like.create(post_id: post.id,user_id: user.id)
    like2 = Like.create(post_id: post.id,user_id: user.id)
    expect(user.likes()).to(eq([like1, like2]))
  end
end
