require 'chef-rundeck'

describe Node  do
  it 'converts array to string in update' do
    n = Node.new()
    n.update({
      'name' => 'server.example.com', 
      'chef_environment' => 'development',
      'roles' => [ 'role1', 'role2' ],
      'tags' => [ 'tag1', 'tag2']
      })

    expect(n['roles']).to eq([ 'role1', 'role2'])
    expect(n['tags']).to eq(['tag1', 'tag2'])
  end

  it 'can be compared to a hash' do
    n = Node.new()
    n.update({
      'name' => 'server.example.com',
      'chef_environment' => 'development',
      'roles' => [ 'role1', 'role2' ]
      })

    expect(n =~ { 'chef_environment' => 'development', 'name' => 'server.example'}).to eq(true)
    expect(n =~ { 'name' => 'server.example' }).to eq(true)
    expect(n =~ { 'name' => 'some_server.example' }).to eq(false)
    expect(n =~ { 'roles' => 'role1' }).to eq(true)
    expect(n =~ { 'roles' => 'role1,role2' }).to eq(true)
    expect(n =~ { 'roles' => 'role1,role3' }).to eq(true)
    expect(n =~ {}).to eq(true)
    expect(n =~ { 'chef_environment' => 'development,staging'}).to eq(true)
  end
end

