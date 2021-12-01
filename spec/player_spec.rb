describe Player do 
  it 'has a name' do 
    player = Player.new('Chris')
    expect(player.name).to eq 'Chris'
  end
end