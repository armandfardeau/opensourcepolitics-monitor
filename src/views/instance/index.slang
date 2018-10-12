.row
  .col-sm-11
    h2 Instances
  .col-sm-1
    a.btn.btn-success.btn-sm href="/instances/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Url
        th Repo
        th Actions
    tbody
      - instances.each do |instance|
        tr
          td = instance.name
          td = instance.url
          td = instance.repo
          td
            span
              == link_to("read", "/instances/#{instance.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/instances/#{instance.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/instances/#{ instance.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
