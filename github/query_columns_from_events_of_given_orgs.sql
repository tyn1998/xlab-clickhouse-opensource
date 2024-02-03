-- 查询指定组织的所有事件（只包含与 Issue、PR 相关的 4 种类型）的以下字段：

-- <所有 payload 都有的通用字段>
-- id
-- type
-- action
-- actor_id
-- actor_login
-- repo_id
-- repo_name
-- org_id
-- org_login
-- created_at

-- <Issue, IssueComment, PullRequest, PullRequestReviewComment>
-- body
-- issue_id
-- issue_number
-- issue_title
-- issue_author_id
-- issue_author_login
-- issue_created_at
-- issue_updated_at
-- issue_comments
-- issue_closed_at

-- <IssueComment>
-- issue_comment_id
-- issue_comment_created_at
-- issue_comment_updated_at
-- issue_comment_author_id
-- issue_comment_author_login
-- <PullRequest, PullRequestReviewComment>
-- pull_merged
-- pull_merged_at
-- pull_merged_by_id
-- pull_merged_by_login

-- <PullRequestReviewComment>
-- pull_review_id
-- pull_review_comment_id
-- pull_review_comment_author_id
-- pull_review_comment_author_login
-- pull_review_comment_created_at
-- pull_review_comment_updated_at

with github_events as (select * from events where platform='GitHub')
select id, type, action, actor_id, actor_login, repo_id, repo_name, org_id, org_login,created_at,
       body, issue_id, issue_number, issue_title, issue_author_id, issue_author_login, issue_created_at, issue_updated_at, issue_comments, issue_closed_at,
       issue_comment_id, issue_comment_created_at, issue_comment_updated_at, issue_comment_author_id, issue_comment_author_login,
       pull_merged, pull_merged_at, pull_merged_by_id, pull_merged_by_login,
       pull_review_id, pull_review_comment_id, pull_review_comment_author_id, pull_review_comment_author_login, pull_review_comment_created_at, pull_review_comment_updated_at
from github_events
where type in ('IssuesEvent', 'IssueCommentEvent', 'PullRequestEvent', 'PullRequestReviewCommentEvent')
    and org_login in ('X-lab2017', 'hypertrons');