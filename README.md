# Propuesta de Proyecto de Grado

Este repositorio contiene el código fuente <span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> de la mi propuesta de trabajo de grado "_Migración de la infraestructura de Firebase a AWS en Paralegales_"

---

**Resumen**:

> (...)

> (...)

> El presente proyecto tiene como objetivo principal migrar y adaptar la infraestructura tecnológica de Paralegales desde Firebase hacia un entorno 100\% en AWS (Amazon Web Services). Esta migración busca mejorar la seguridad del sistema, aumentar la escalabilidad y reducir los costos operativos, además de permitir trasladar lógica de negocio sensible actualmente implementada en el _frontend_ hacia entornos seguros como AWS Lambda.

**Key Words**: Ingeniería de software, Microservicios, Enterprise migration, Cloud computing, APIs, Vendor lock-in, Legaltech.

---

## Get Started

Este repo hace uso de un setup basado principalmente en vscode, con la extensión [<span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> Workshop](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install). Como <span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> engine se usa [TinyTex](https://yihui.org/tinytex/) y con `tlmgr`se instalan los paquetes necesarios.

Como herramientas de desarrollo se usan: 1. `tex-fmt`, Formateador de Tex escrito en Rust; 2. `chktex`, Linter para Tex, 3. `TaskFile`, para correr scripts rutinarios; 4. Spell Checker, extensión de vscode para la corrección ortográfica

### Instalación (Unix systems)

Corre los siguientes comandos

```sh
chmod +x ./scripts/install.sh
./scripts/install.sh
```

> [!NOTE]
> En caso de dar problemas con la librería `libxcrypt` (dependencia necesaria del paquete biber) instalela con el gestor de paquetes de su sistema. e.g `sudo pacman -S libxcrypt-compat` para Arch Linux.

### Desinstalar

Corre los siguientes comandos

```sh
chmod +x ./scripts/install.sh
./scripts/install.sh
```

> [!NOTE]
> Comenta partes del script en tu repo local para evitar eliminar dependencias que te puedan ser útiles.

<style>
/* Styles for latex logo */
.latex sub, .latex sup {
    text-transform: uppercase;
}

.latex sub {
    vertical-align: -0.5ex;
    margin-left: -0.1667em;
    margin-right: -0.125em;
}

.latex, .latex sub {
    font-size: 1em;
}

.latex sup {
    font-size: 0.85em;
    vertical-align: 0.15em;
    margin-left: -0.36em;
    margin-right: -0.15em;
}
</style>
