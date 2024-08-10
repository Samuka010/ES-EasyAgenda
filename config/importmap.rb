# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@fullcalendar/core", to: "https://cdn.skypack.dev/@fullcalendar/core@6.1.14" # @6.1.14
pin "preact" # @10.12.1
pin "preact/compat", to: "preact--compat.js" # @10.12.1
pin "preact/hooks", to: "preact--hooks.js" # @10.12.1
pin "@fullcalendar/daygrid", to: "https://cdn.skypack.dev/@fullcalendar/daygrid@6.1.14" # @6.1.14
