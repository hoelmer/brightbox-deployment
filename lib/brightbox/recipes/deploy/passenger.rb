#    Brightbox - Easy Ruby Web Application Deployment
#    Copyright (C) 2008, David Smalley, Brightbox Systems
#
#    This file is part of the Brightbox deployment system
#
#    Brightbox gem is free software: you can redistribute it and/or modify it
#    under the terms of the GNU Affero General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General
#    Public License along with this program.  If not, see
#    <http://www.gnu.org/licenses/>.
#

namespace :deploy do
  
  #Override start and stop, they are useless for passenger
  %w(start stop status).each do |event|
    desc "Dummy command to #{event} your application, not used by Passenger."
    task event, :roles => :app, :except => {:no_release => true } do
    end
  end
  
  desc "Restart your application using passenger."
  task :restart, :roles => :app, :except => {:no_release => true} do
    try_sudo "touch #{current_path}/tmp/restart.txt"
  end
  
end