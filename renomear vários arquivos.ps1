# POWERSHELL
# Este script PowerShell tem como objetivo renomear arquivos
# dentro de um diretório principal e seus subdiretórios, removendo
# partes específicas de seus nomes.

$mainPath = "<INFORME O DIRETÓRIO AQUI>"

$files = Get-ChildItem -Path $mainPath -Recurse -File

foreach ($file in $files) {
    $newName = $file.BaseName -replace "\s+\(EXEMPLO_COM_PARÊNTESES\)", "" -replace "\s+\(MAIS STRINGS\)", ""
    $newPath = Join-Path -Path $file.Directory.FullName -ChildPath ($newName + $file.Extension)
    Rename-Item -Path $file.FullName -NewName $newPath -Force
}

Write-Host "Processo concluído."
