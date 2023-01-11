BlackStack::Extensions::add ({
    # descriptive name and descriptor
    :name => 'enrichment',
    
    # Write a description here. It will be shown in the main dashboard of your MySaaS project.
    :description => 'Add emails, phone numbers and company insights to your current list of leads',

    # setup the url of the repository for installation and updates
    :repo_url => 'https://github.com/enrichment',
    :repo_branch => 'main',

    # define version with format <mayor>.<minor>.<revision>
    :version => '0.0.1',

    # define the name of the author
    :author => 'Leandro Daniel Sardi',

    # what is the section to add this extension in either the top-bar, the footer, the dashboard.
    :services_section => 'Services',
    # show this extension as a service in the top bar?
    :show_in_top_bar => true,
    # show this extension as a service in the footer?
    :show_in_footer => true,
    # show this extension as a service in the dashboard?
    :show_in_dashboard => true,

    :dependencies => [
        #{ :extension => :content, :version => '0.0.1' },
    ],

    # what are the screens to add in the leftbar
    :leftbar_icons => [
        { :label => 'orders', :icon => :search, :screen => :results, },
    ],
 
    # add a folder to the storage from where user can download the exports.
    :storage_folders => [
        #{ :name => 'dfy-leads.pages', },
    ],
})

# defining Pampa jobs
BlackStack::Pampa.add_job({
  :name => 'enrichment.lead.enrich',

  # Minimum number of tasks that a worker must have in queue.
  # Default: 5
  :queue_size => 1, 
  
  # Maximum number of minutes that a task should take to process.
  # If a tasks didn't finish X minutes after it started, it is restarted and assigned to another worker.
  # Default: 15
  :max_job_duration_minutes => 10,  
  
  # Maximum number of times that a task can be restarted.
  # Default: 3
  :max_try_times => 3,

  # Define the tasks table: each record is a task.
  # The tasks table must have some specific fields for handling the tasks dispatching.
  :table => :fl_lead, # Note, that we are sending a class object here
  :field_primary_key => :id,
  :field_id => :enrich_reservation_id,
  :field_time => :enrich_reservation_time, 
  :field_times => :enrich_reservation_times,
  :field_start_time => :enrich_start_time,
  :field_end_time => :enrich_end_time,
  :field_success => :enrich_success,
  :field_error_description => :enrich_error_description,

  # Function to execute for each task.
  :processing_function => Proc.new do |task, l, job, worker, *args|
    # TODO: Code Me!
  end
})