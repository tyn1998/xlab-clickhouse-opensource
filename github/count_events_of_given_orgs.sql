-- 统计指定 orgs 下的事件数量

with github_events as (select * from events where platform='GitHub')
select count(*) from github_events where org_login in ('microsoft');