# WinRAR Escape Simulation

Este repositório contém uma **prova de conceito (PoC)** que demonstra como a extração de arquivos no **WinRAR** pode ser explorada para executar ações não previstas pelo usuário.

O script em **PowerShell** utiliza o `FileSystemWatcher` para monitorar uma pasta.  
Quando detecta a criação do arquivo `marker.txt`, ele automaticamente cria um atalho na pasta de inicialização do Windows que abre a **Calculadora**.

---

## ⚠️ Aviso
Este projeto é **exclusivamente para fins educacionais e de pesquisa em segurança**.  
Não deve ser utilizado em ambientes de produção ou para qualquer finalidade maliciosa.

---

## Como funciona
1. O script observa uma pasta definida no parâmetro `$pathToWatch`.
2. Quando o arquivo `marker.txt` é extraído para essa pasta, o evento é disparado.
3. O PowerShell cria um **atalho na pasta de inicialização do Windows** que abre a Calculadora (`calc.exe`) ao iniciar o sistema.

🎥 Vídeo de demonstração
Você pode assistir ao vídeo explicando este exemplo no YouTube:
👉 [Falha GRAVE no WinRAR - YouTube](https://youtu.be/hZzwrA0npvM)
