#!/usr/bin/env bash

# Detiene el script si ocurre un error.
set -o errexit

# Detiene el script si se utiliza una variable no definida.
set -o nounset

# Propaga errores ocurridos dentro de pipelines.
set -o pipefail

. scripts/config.sh

main() {
    echo "Installing Git submodules..."

    # Sincroniza las URLs configuradas en .gitmodules
    # con la configuración local de Git.
    git submodule sync --recursive

    # Inicializa e instala todos los submódulos definidos
    # en .gitmodules, incluyendo submódulos anidados.
    #
    # Si ya están instalados, Git no los duplica.
    # Además, los posiciona en el commit registrado
    # por el repositorio principal.
    git submodule update --init --recursive

    echo "Stowing dotfiles..."

    # Crea los enlaces simbólicos de los archivos de configuración.
    # La función stow_dotfiles está definida en uno de
    # los scripts cargados anteriormente.
    stow_dotfiles

    echo "Done."
}

# Ejecuta la función principal y transmite los argumentos
# recibidos por el script.
main "$@"
