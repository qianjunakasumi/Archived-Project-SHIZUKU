cd ../

$root = "github.com/qianjunakasumi/project-shizuku/"
$commitid = git rev-parse --short master

"��ʼ���������..."

go vet cmd/shizuku/main.go
scripts/golangci-lint.exe run

"��ȷ�ϣ����������ʼ����"
[Console]::ReadKey() | Out-Null

"��ʼ����..."

$env:GOOS="linux"
go build -ldflags "-w -X ${root}configs.CommitId=${commitid}" -o build/shizuku cmd/shizuku/main.go

"������ɣ���������˳�..."
[Console]::ReadKey() | Out-Null
