#! /usr/bin/env nix-shell
#! nix-shell -i ruby -p ruby

# frozen_string_literal: true

require %(json)

repos = File.read %(repos.json)
repos = JSON.parse repos
puts repos
# repos = {
#   Misterio77: {
#     'nix-config': {
#       address: %(https://github.com/Misterio77/nix-config.git)
#     }
#   }
# }
#
# repos.keys.map(&:to_sym).each do |user|
#   system %(mkdir -p #{user}) unless Dir.exist?(user.to_s)
#   repos[user].keys.map(&:to_sym).each do |repo|
#     repo_path = File.join(user.to_s, repo.to_s)
#     clone_cmd = []
#     clone_cmd << %(git)
#     clone_cmd << %(clone)
#     clone_cmd << repos[user][repo][:address]
#     clone_cmd << repo_path
#     system clone_cmd.join(%( )) unless Dir.exist?(repo_path)
#   end
# end
