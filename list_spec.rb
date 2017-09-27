require "rspec"

require_relative "task"
require_relative "list"

describe List do
  # Your specs here
  let(:title) { "Groceries" }
  let(:tasks) { [Task.new("poodle"), Task.new("chihuaha")] }
  let(:list)  { List.new(title, tasks)}

  describe "#initialize" do
    it "takes an argument and an array" do
      expect(List.new("Dog", [1,2,3]))
    end

    it "requires at least one argument" do
      expect {List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#description" do
    it "returns the correct title for the list" do
      expect(list.title).to eq title
    end
  end

  describe "#add_task" do
    it "requires one argument" do
      expect {list.add_task}.to raise_error(ArgumentError)
    end

    it "adds a task to the current tasks" do
      initial_count = list.tasks.count
      list.add_task('pigs')
      expect(list.tasks.count).to eq (initial_count+1)
    end
  end

  describe "#complete_task" do
    it "requires at least one argument" do
      expect {list.complete_task}.to raise_error(ArgumentError)
    end

    it "returns true for completed tasks" do
      expect(list.tasks[0]).not_to be_complete
      list.complete_task(0)
      expect(list.tasks[0]).to be_complete
    end
  end

  describe "#delete_task" do
    it "requires at least one argument" do
      expect {list.delete_task}.to raise_error(ArgumentError)
    end

    it "deletes a task" do
      store = list.tasks[0]
      list.delete_task(0)
      expect(list.delete_task(0)).not_to eq store
    end
  end

  describe '#completed_tasks' do
    it "shows completed tasks" do
      expect(list.completed_tasks.count).to eq 0
      list.complete_task(0)
      expect(list.completed_tasks.count).to eq 1
    end

    it "shows incompleted tasks" do
      expect(list.incomplete_tasks.count).to eq list.tasks.count
      list.complete_task(0)
      expect(list.incomplete_tasks.count).to eq list.tasks.count-1
    end
  end
end