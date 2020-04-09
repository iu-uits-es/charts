{{/* vim: set filetype=mustache: */}}

{{/*
Generate Ingress hostname
*/}}
{{- define "redis-ha.ingressHostname" -}}
{{- if .Values.ingress.domainName -}}
{{- printf "%s.%s" .Release.Name .Values.ingress.domainName -}}
{{- else -}}
{{- printf "%s.uits.iu.edu" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Generate Traefik Ingress route match rule by using
HostSNI, Release name and domain name
*/}}
{{- define "redis-ha.ingressRouteMatch" -}}
{{- printf "HostSNI(`%s`)" (include "redis-ha.ingressHostname" .) -}}
{{- end -}}
