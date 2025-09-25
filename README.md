



#### После тонны настроек - получилось синхронизировать argo cd и манифест мой, Но на постояне не получилось ( делал через ngrok), Но не получилось решить проблему с webhook по POST /api/webhook, хотя ngrok видит. Скрины ниже , настройка ( частичная) ниже
<img width="2824" height="1676" alt="image" src="https://github.com/user-attachments/assets/07b700eb-f508-4c64-a543-2200ff139475" />

<img width="539" height="335" alt="Снимок экрана 2025-09-25 в 03 07 28" src="https://github.com/user-attachments/assets/9ad1c939-c33a-449a-9838-8960a02baf65" />


<img width="1375" height="715" alt="Снимок экрана 2025-09-25 в 03 03 04" src="https://github.com/user-attachments/assets/fce184bd-75f2-4242-95df-66bf78774ae1" />


#### Полный цикл "Выключить-Включить"
Выключаем:
#### 1. Удаляем приложение из Argo CD
`argocd app delete quackjs-app`

#### 2. Останавливаем Argo CD
`kubectl delete namespace argocd`

#### 3. Останавливаем port-forward (Ctrl+C)
Включаем через неделю:
#### 1. Стартуем Argo CD
`kubectl create namespace argocd`
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`

#### 2. Port-forward (в отдельном терминале)
`kubectl port-forward svc/argocd-server -n argocd 8080:443`

#### 3. Восстанавливаем приложение
```
argocd login localhost:8080
argocd app create quackjs-app \
  --repo https://github.com/Allower9/TU_SQL_k8s \
  --path ./manifests \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace web \
  --sync-policy automated
```
#### 4. Синхронизируем (если нужно)
`argocd app sync quackjs-app`
