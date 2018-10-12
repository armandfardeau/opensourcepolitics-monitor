.row
  - instances.each do |instance|
    .col-sm-12.col-md-6.col-xl-4
        .card-wrapper
          .card
            .img-wrapper
              img(src="#{instance.picture}")
            h2 = instance.name
            .btn-wrapper
              == link_to("Visit website", instance.url.to_s)
              == link_to("View github", instance.repo.to_s)
