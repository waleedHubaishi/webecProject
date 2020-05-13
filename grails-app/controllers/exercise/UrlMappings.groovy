package exercise

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"{
            controller = "Socrative"
            action = "index"
        }

        "/socrative/addQuestion"(controller: "Socrative", action: "addQuestion")

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
