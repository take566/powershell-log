<#
 Powershell起動時の自動実行Script
   FileName        : C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
   Script Version  : 1.0 
   ExecutionPolicy : Remotesigned
   LastUpdate      : 2017/12/10

   History:
    2017/12/10 新規作成(自動ログ取得,プロンプト時刻表示実装)
#>

# 自動ログ取得開始
$LogFolder   = 'C:\work\Log'
$TimeStamp   = (Get-Date -Format 'yyyyMMdd-HHmmss')
$UserInfo    = $Env:COMPUTERNAME + '-' + $Env:USERNAME
$LogFilePath = $LogFolder + '\PS_' + $TimeStamp + '_' + $UserInfo + '.log'

Start-Transcript -Path $LogFilePath -Append

# プロンプトに時刻表示
function global:prompt {
  (Get-Date -format "[yyyy/MM/dd HH:mm:ss]") + " PS " + $(get-location) + "> "
}