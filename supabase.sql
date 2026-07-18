-- GUSTY NEWS AI V4 — ejecutar una sola vez en Supabase > SQL Editor
-- Después, en Authentication > Providers, habilita Anonymous Sign-Ins.

create extension if not exists pgcrypto;

create table if not exists public.publications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid(),
  topic text not null,
  facts text not null,
  edition text not null,
  tone text not null,
  format text not null,
  content text not null,
  created_at timestamptz not null default now()
);

alter table public.publications enable row level security;

-- Cada usuario anónimo o permanente solo puede ver sus propias publicaciones.
drop policy if exists "users_read_own_publications" on public.publications;
create policy "users_read_own_publications"
on public.publications for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "users_insert_own_publications" on public.publications;
create policy "users_insert_own_publications"
on public.publications for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "users_delete_own_publications" on public.publications;
create policy "users_delete_own_publications"
on public.publications for delete
to authenticated
using ((select auth.uid()) = user_id);

create index if not exists publications_user_created_idx
on public.publications (user_id, created_at desc);

grant select, insert, delete on table public.publications to authenticated;
revoke all on table public.publications from anon;
