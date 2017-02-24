{* NSMARTY TEMPLATE TEST *}

<h1>{$title}</h1>

{foreach $books as $i => $book}
    <div style="background-color: {cycle values='cyan,yellow'};">
        [{$i+1}] {$book.title|upper} by {$book.author}

        {if $book.price}                                
            Price: <span style="color:red">&euro;{$book.price}</span>
        {/if}
    </div>
{else}
    No books
{/foreach}