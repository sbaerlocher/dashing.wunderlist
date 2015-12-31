require 'rest-client'
wunderlisttoken = ''
wunderlistclient = ''

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '5m', :first_in => 0 do |job|
  title = []

  raw_lists = JSON.parse(RestClient.get('https://a.wunderlist.com/api/v1/lists', {:'X-Access-Token' => wunderlisttoken , :'X-Client-ID' => wunderlistclient }))

  raw_lists.map do |list|
   url = "https://a.wunderlist.com/api/v1/tasks?list_id="+list['id'].to_s
   raw_tasks = JSON.parse(RestClient.get(url, {:'X-Access-Token' => wunderlisttoken , :'X-Client-ID' => wunderlistclient }))

   raw_tasks.map do |task|
     date =  DateTime.now
     next if task['due_date'] == nil or task['due_date'] > date.strftime("%Y-%m-%d")   
     subtitle = []
     url = "https://a.wunderlist.com/api/v1/subtasks?completed=true&task_id="+task['id'].to_s
     raw_subtasks = JSON.parse(RestClient.get(url, {:'X-Access-Token' => wunderlisttoken , :'X-Client-ID' => wunderlistclient }))
     raw_subtasks.map do |subtask|
       next if subtask['title'] == nil
       next if subtask['completed'] == true
       subtitle << ' '+subtask['title']
     end
     title.push(title: task['title'], subtasks: subtitle)
    end
  end

  send_event('wunderlist',  tasks: title)

end