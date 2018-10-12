h1 Show Instance
p = instance.name
p = instance.url
p = instance.repo
p
  == link_to("back", "/instances", class: "btn btn-light btn-sm")
  == link_to("edit", "/instances/#{instance.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/instances/#{instance.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
