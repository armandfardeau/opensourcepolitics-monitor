- if instance.errors
  ul.errors
    - instance.errors.each do |error|
      li = error.to_s

== form(action: "/instances/#{instance.id.to_s}", method: instance.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: instance.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "url", value: instance.url, placeholder: "Url", class: "form-control")
  .form-group
    == text_field(name: "repo", value: instance.repo, placeholder: "Repo", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/instances", class: "btn btn-light btn-sm")
