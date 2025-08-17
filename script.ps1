# ========================
$pathToWatch = "C:"   # pasta onde vai extrair o RAR
$markerName  = "marker.txt"        # arquivo que sinaliza a extração

# ========================

# Observador de sistema de arquivos para detectar o 'marker'
$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path  = $pathToWatch
$fsw.Filter = $markerName
$fsw.EnableRaisingEvents = $true
$fsw.IncludeSubdirectories = $false

# Ação: ao detectar o marker, cria um atalho na pasta de inicialização que abre a calculadora
$action = {
    try {
        $startup = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"
        $shortcutPath = Join-Path $startup "AbrirCalculadora.lnk"

        $wsh = New-Object -ComObject WScript.Shell
        $lnk = $wsh.CreateShortcut($shortcutPath)
        $lnk.TargetPath = "$env:Windir\System32\calc.exe"
        $lnk.WorkingDirectory = "$env:Windir\System32"
        $lnk.IconLocation = "$env:Windir\System32\calc.exe,0"
        $lnk.Save()

        Write-Host "[OK] Atalho criado: $shortcutPath"
    } catch {
        Write-Host "[ERRO]" $_.Exception.Message
    }
}

# Registra o evento "Created"
$subscription = Register-ObjectEvent -InputObject $fsw -EventName Created -Action $action

Write-Host "Aguardando extração de '$markerName' em $($fsw.Path). Pressione Ctrl+C para parar."
