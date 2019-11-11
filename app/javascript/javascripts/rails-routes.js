// Don't edit manually. `rake js:routes` generates this file.
function process(route, params, keys) {
  var query = [];
  for (var param in params) if (params.hasOwnProperty(param)) {
    if (keys.indexOf(param) === -1) {
      query.push(param + "=" + encodeURIComponent(params[param]));
    }
  }
  return query.length ? route + "?" + query.join("&") : route;
}

export function startTaskPath(params) { return process('/tasks/' + params.id + '/start', params, ['id']); }
export function completeTaskPath(params) { return process('/tasks/' + params.id + '/complete', params, ['id']); }
export function cloneTaskPath(params) { return process('/tasks/' + params.id + '/clone', params, ['id']); }
export function pauseTaskPath(params) { return process('/tasks/' + params.id + '/pause', params, ['id']); }
export function postponeTaskPath(params) { return process('/tasks/' + params.id + '/postpone', params, ['id']); }
export function notCompletedTasksPath(params) { return process('/tasks/not_completed', params, []); }
export function tasksPath(params) { return process('/tasks', params, []); }
export function newTaskPath(params) { return process('/tasks/new', params, []); }
export function editTaskPath(params) { return process('/tasks/' + params.id + '/edit', params, ['id']); }
export function taskPath(params) { return process('/tasks/' + params.id + '', params, ['id']); }
export function startApiV1TaskPath(params) { return process('/api/v1/tasks/' + params.id + '/start', params, ['id']); }
export function completeApiV1TaskPath(params) { return process('/api/v1/tasks/' + params.id + '/complete', params, ['id']); }
export function cloneApiV1TaskPath(params) { return process('/api/v1/tasks/' + params.id + '/clone', params, ['id']); }
export function pauseApiV1TaskPath(params) { return process('/api/v1/tasks/' + params.id + '/pause', params, ['id']); }
export function postponeApiV1TaskPath(params) { return process('/api/v1/tasks/' + params.id + '/postpone', params, ['id']); }
export function completeApiTaskPath(params) { return process('/api/tasks/' + params.id + '/complete', params, ['id']); }
export function commentApiTaskPath(params) { return process('/api/tasks/' + params.id + '/comment', params, ['id']); }
export function doingApiTasksPath(params) { return process('/api/tasks/doing', params, []); }
export function apiTasksPath(params) { return process('/api/tasks', params, []); }
export function startApiShortcutPath(params) { return process('/api/shortcuts/' + params.id + '/start', params, ['id']); }
export function apiShortcutsPath(params) { return process('/api/shortcuts', params, []); }
