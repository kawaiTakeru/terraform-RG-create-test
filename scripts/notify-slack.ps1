param (
  [string]$webhookUrl,
  [string]$pipelineName,
  [string]$buildId,
  [string]$projectName
)

# 🔍 デバッグログ：送信直前のURL
Write-Host "DEBUG: Webhook URL = [$webhookUrl]"

# 本文の JSON を生成
$payloadObj = @{
  text = "❌ Terraform Apply に失敗しました（デバッグ付き）`n" +
         "パイプライン: $pipelineName`n" +
         "ビルドID: $buildId`n" +
         "URL: https://dev.azure.com/$projectName/_build/results?buildId=$buildId&view=results"
}
$payloadJson = $payloadObj | ConvertTo-Json -Depth 4

# 🔍 デバッグログ：送信予定のJSON
Write-Host "DEBUG: Payload JSON = $payloadJson"

# Slackに送信
$response = Invoke-RestMethod `
  -Uri $webhookUrl `
  -Method POST `
  -Body $payloadJson `
  -ContentType 'application/json; charset=utf-8' `
  -ErrorAction Stop

# 🔍 デバッグログ：Slackの応答
Write-Host "DEBUG: Slack response = $response"

