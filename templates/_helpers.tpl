{{/*
Expand the name of the chart.
*/}}
{{- define "novosga.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "novosga.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "novosga.labels" -}}
helm.sh/chart: {{ include "novosga.chart" . }}
{{ include "novosga.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "novosga.db.labels" -}}
server: db
{{- end -}}

{{- define "novosga.app.labels" -}}
app: novosga
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "novosga.selectorLabels" -}}
app.kubernetes.io/name: {{ include "novosga.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "novosga.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "novosga.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
