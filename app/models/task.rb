class Task < ActiveRecord::Base
  belongs_to :project

  after_update :update_percent_complete if :mark_completed?
  after_create :update_percent_complete

  scope :completed, -> { where(completed: true) }

  def mark_completed?
    self.completed == true
  end

  def update_percent_complete
    puts "8" * 100
    project = Project.find(self.project_id)
    count_of_completed_tasks = project.tasks.completed.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(count_of_completed_tasks, count_of_total_tasks))
  end
end
