/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kennahi <kennahi@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/21 11:51:53 by kennahi           #+#    #+#             */
/*   Updated: 2021/10/12 16:12:42 by kennahi          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/libft.h"

static void	ft_kill(int pid, char *str)
{
	static int	i = 0;
	char		c;

	while (*str)
	{
		i = 8;
		c = *str++;
		while (i--)
		{
			if (c >> i & 1)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(100);
		}
	}
	i = 8;
	while (i--)
	{
		kill(pid, SIGUSR1);
		usleep(100);
	}
}

int	main(int ac, char **av)
{
	char	*msg;

	if (ac != 3 || !ft_strlen(av[2]))
		return (1);
	msg = ft_strdup(av[2]);
	ft_kill(ft_atoi(av[1]), msg);
	free(msg);
	return (0);
}
