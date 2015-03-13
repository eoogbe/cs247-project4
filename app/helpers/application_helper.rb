module ApplicationHelper
  def logout_link
    link_to 'Logout', destroy_user_session_path, method: :delete,
      form_class: "clearfix", form: { id: "logout-link" },
      class: "btn-link full-width"
  end
  
  def url_with_query url, query = nil
    if query.nil?
      query = url
      url = request.path_info
    end
    
    query_string = query.reduce("") do |accum, obj|
      name, val = obj
      "#{accum}&#{name}=#{val}"
    end
    
    url + (url.include?('?') ? '&' : '?') + query_string[1..-1]
  end
  
  def navbar_menuitems
    [["Home", connections_path],
      ["Add students to your home", new_connection_path],
      ["Remove students from your home", delete_connections_path],
      ["Create a new student profile", new_student_path],
    ]
  end
end
