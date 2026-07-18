# Gusty News AI™ V4

Aplicación web móvil para crear contenido multired y guardar historial local o en Supabase.

## Incluye

- Instagram Feed, Reel, Story y Carrusel.
- Facebook, Telegram, LinkedIn, X y TikTok/Shorts.
- Tono periodístico, viral, premium, debate o humano.
- Prompt automático para portadas 9:16.
- Historial local en el teléfono.
- Sincronización opcional con Supabase.
- Vercel listo, sin servidor Python ni funciones que provoquen error 500.

## Actualizar el proyecto existente

Sube estos archivos al repositorio `gusty-news-ai-v3`, reemplazando los anteriores:

- `index.html`
- `vercel.json`
- `README.md`
- `supabase.sql`

Vercel desplegará automáticamente la nueva versión.

## Configurar Supabase

1. Crea un proyecto en Supabase.
2. Abre SQL Editor, pega todo el contenido de `supabase.sql` y ejecútalo.
3. En Authentication > Providers, habilita Anonymous Sign-Ins.
4. En Project Settings > API, copia Project URL y la clave pública publishable/anon.
5. Abre Gusty News AI V4, pulsa `Supabase`, pega ambos datos y conecta.

Nunca pegues la clave `service_role` en una aplicación web.

## Nota

La generación de texto de V4 funciona localmente con plantillas. Supabase se usa para el historial. Una conexión posterior con un modelo de IA debe hacerse mediante una función segura del servidor o Supabase Edge Function, nunca exponiendo una clave privada en el navegador.
