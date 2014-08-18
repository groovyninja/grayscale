import grayscale.EMail

class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'EMail', action: 'main_page') // <-- устанавливаем страницу по умолчанию
        "/index"(view:"/index") // <-- отображаем прежнюю страницу приветствия на явный псевдоним index
        "500"(view:'/error')
	}
}
