# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "mrujs", to: "https://ga.jspm.io/npm:mrujs@1.0.0/dist/index.module.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.7.0/dist/morphdom-esm.js"
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.6/lib/assets/compiled/rails-ujs.js"
