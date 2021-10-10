{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{define "app.name"}}{{default "app" .Values.appName | trunc 63 | trimSuffix "-" }}{{end}}
{{define "app.netPolName"}}{{default "app" .Values.netpol.name | trunc 63 | trimSuffix "-" }}{{end}}
{{define "appK8s.name"}}{{default "app-k8s" .Values.appK8sName | trunc 63 | trimSuffix "-" }}{{end}}
{{define "appK8sName.name"}}{{default "app_name" .Values.appName | trunc 63 | trimSuffix "-" }}{{end}}
{{define "appK8sName.netPolName"}}{{default "app" .Values.netpol.name | trunc 63 | trimSuffix "-" }}{{end}}
{{define "Vault.name"}}{{default "app-vault" .Values.appVaultName | trunc 63 | trimSuffix "-" }}{{end}}
{{/*
Create a default fully qualified app name.

We truncate at 63 chars because some Kubernetes name fields are limited to this
(by the DNS naming spec).
*/}}
{{define "appK8s.fullname"}}
{{- $name := default "app-k8s" .Values.appK8sName -}}
{{printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{end}}
{{define "appVault.fullname"}}
{{- $name := default "app-vault" .Values.appVautName -}}
{{printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{end}}

{{/*
Provide a pre-defined claim or a claim based on the Release
*/}}
{{- define "app.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else -}}
{{- template "app.fullname" . }}
{{- end -}}
{{- end -}}
