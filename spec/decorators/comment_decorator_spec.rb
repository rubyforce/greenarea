require 'spec_helper'

describe CommentDecorator do
	describe ".created_at" do
		let(:comment) { create(:comment, created_at: Date.parse("20.12.1987")).decorate }

		it { expect(comment.created_at).to eq("Sunday, December 20") }
	end
end
