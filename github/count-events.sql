-- 查询 GitHub 事件总数
with github_events as (select * from events where platform='GitHub')
select count(*) from github_events;