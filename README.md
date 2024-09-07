
# UIConfig

UIConfig es una librería diseñada para simplificar la configuración y personalización de componentes de interfaz de usuario (UI) en aplicaciones iOS. Este proyecto busca brindar una manera centralizada y escalable de gestionar las configuraciones de UI en proyectos, facilitando tanto su implementación como su mantenimiento.

## Tabla de Contenidos

- [Características](#características)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Uso](#uso)
  - [Configuración de Botones](#configuración-de-botones)
  - [Configuración de Etiquetas](#configuración-de-etiquetas)
  - [Extensiones Disponibles](#extensiones-disponibles)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Características

- **Modular y Reutilizable**: UIConfig permite aplicar configuraciones de UI reutilizables para componentes comunes como botones, etiquetas, vistas, y más.
- **Centralización de Estilos**: Permite definir un estilo de UI una vez y aplicarlo en cualquier parte del proyecto, asegurando coherencia en el diseño visual.
- **Personalización Rápida**: Cambia las propiedades visuales de los componentes fácilmente desde una configuración única.
- **Escalabilidad**: Ideal para proyectos de todos los tamaños, desde aplicaciones pequeñas hasta proyectos más complejos.

## Requisitos

- **Xcode** 12.0 o superior
- **Swift** 5.0 o superior
- **iOS** 13.0 o superior

## Instalación

### Clonar el Repositorio

Puedes clonar este repositorio utilizando el siguiente comando:

```bash
git clone https://github.com/juanjoseen/UIConfig.git
```

### Integración Manual

1. Clona o descarga el proyecto.
2. Copia el contenido del directorio `UIConfig` en tu proyecto.
3. Importa la librería en los archivos donde planees usarla:

```swift
import UIConfig
```

## Uso

Una vez instalado, puedes comenzar a usar UIConfig para configurar tus componentes de UI de manera centralizada y consistente.

### Configuración de Botones

Para aplicar configuraciones personalizadas a un botón:

```swift
import UIConfig

let button: UIButton = UIButton(title: "Click me", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: .lineHeight, radius: .standardRadius)
button.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)

...

@objc func actionButton(_ sender: UIButton) {
     print("Button Clicked!")
}
```

### Configuración de Etiquetas

De igual forma, puedes configurar etiquetas utilizando el módulo correspondiente de UIConfig:

```swift
import UIConfig

let label: UILabel = UILabel(text: "Hello World!", color: .textColor, font: .title, alignment: .center)
```

### Extensiones Disponibles

UIConfig incluye varias extensiones que permiten aplicar configuraciones fácilmente a los siguientes elementos:

- **Botones** (`UIButton`)
- **Etiquetas** (`UILabel`)
- **Vistas** (`UIView`)
- **Imagenes** (`UIImageView`)
- **TextFields** (`UITextField`)
- **CollectionViews** (`UICollectionView`)
- **TableViews** (`UITableView`)
- **Fonts** (`UIFont`)
- **Colors** (`UIColor`)
- **Controllers** (`UIController`)
  
Cada una de estas extensiones incluye métodos convenientes para aplicar configuraciones de estilo predefinidas o personalizadas.

## Contribuciones

Las contribuciones a UIConfig son bienvenidas. Si tienes ideas para nuevas características o mejoras, por favor sigue estos pasos:

1. Haz un fork del proyecto.
2. Crea una nueva rama (`git checkout -b feature-nueva-funcionalidad`).
3. Realiza tus cambios y haz commit de los mismos (`git commit -m 'Añadir nueva funcionalidad'`).
4. Envía tu Pull Request.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para más detalles.
