#!/bin/zsh

echo "🔄 zprezto Update..."

# zprezto upstream
echo "🔄 Updating zprezto upstream..."
cd ~/.zprezto
git fetch origin

if git status | grep -q "behind"; then
    echo "📥 New updates available, pulling.."
    git pull --rebase origin master
    git submodule update --init --recursive
    echo "✅ zprezto updated"
else
    echo "✅ zprezto already up to date"
fi

# eigenes repo
echo "💾 Checking custom.."

if [[ "$1" == "ja" ]]; then

    ZSH_CUSTOM_DIR="${0:h}"

    cd $ZSH_CUSTOM_DIR 
    if git status --porcelain | grep -q "."; then
        echo "📝 Changes detected in custom config, committing..."
        git add .
        git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "✅ Custom config committed"
    else
        echo "✅ No changes in custom config"
    fi

    echo ""
    echo "🎉 Update finish - Restart exec zsh"

else
    echo "⏭️  Parameter 'ja' not provided - skipping custom repo update"
    echo "   ./update.sh ja (to update custom repo)"
fi