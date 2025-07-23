param (
  [string]$webhookUrl,
  [string]$pipelineName,
  [string]$buildId,
  [string]$projectName
)

Write-Host "DEBUG: Webhook URL = [$webhookUrl]"

$payloadObj = @{
  text = "❌ Terraform Apply に失敗しました（デバッグ付き）`nパイプライン: $pipelineName`nビルドID: $buildId`nURL: https://dev.azure.com/$projectName/_build/results?buildId=$buildId&view=results"
}
$payloadJson = $payloadObj | ConvertTo-Json -Depth 4

Write-Host "DEBUG: Payload JSON = $payloadJson"

$response = Invoke-RestMethod `
  -Uri $webhookUrl `
  -Method POST `
  -Body $payloadJson `
  -ContentType 'application/json; charset=utf-8' `
  -ErrorAction Stop

Write-Host "DEBUG: Slack response = $response"
